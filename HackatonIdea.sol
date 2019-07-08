pragma solidity ^0.5.10;

contract HackatonIdea {
    
    address owner;
    uint minApprovers;
    
    struct Idea{
        string description;
        address payable beneficiary;
        uint approvalsQuantity;
        mapping (address => bool) approvedBy;
        uint256 value;
    }
    
    mapping(uint256=> Idea) public ideas ;
    uint256 MaxIdeas;
    mapping (address => bool) isApprover;
    
   
    
    
    constructor(address[] memory _approvers, uint _minApprovers) public {
        require(_minApprovers <= _approvers.length,
                "Minimum approvers should be less than the total amount of Approvers");

        minApprovers = _minApprovers;
        
        owner = msg.sender;

        for (uint i = 0; i < _approvers.length; i++) {
            address approver = _approvers[i];
            isApprover[approver] = true;
        }
    }
    
    
    function submitIdea(string memory _Description,  address payable _beneficiary, uint256 _value) public payable returns(uint256){
        require (msg.sender == owner, "You are not the owner of this contract");
        require (bytes(_Description).length > 0, "Description cannot be empty");
        require (msg.value == _value, "You need to send the same amount of ETH that the Idea requires to be funded. ");
        MaxIdeas++;
        ideas[MaxIdeas].description = _Description;
        ideas[MaxIdeas].beneficiary = _beneficiary;
        ideas[MaxIdeas].value = _value;
        return(MaxIdeas);
    }
    

    function approveIdea(uint _ideaID) public { 
        require(isApprover[msg.sender], "Not an approver.");
        
        if (!ideas[_ideaID].approvedBy[msg.sender]) {
            ideas[_ideaID].approvedBy[msg.sender] = true;
            ideas[_ideaID].approvalsQuantity++;
        }
        
        require(address(this).balance >= ideas[_ideaID].value, "Not enough balance to fund this idea.");
        if (ideas[_ideaID].approvalsQuantity == minApprovers) {
            ideas[_ideaID].beneficiary.transfer(ideas[_ideaID].value);
      
        }
    }

}
