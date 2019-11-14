pragma solidity ^0.4.11;

contract owned {
    address public owner;

    constructor () public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "no owner");
        _;
    }

    function transferOwnerShip(address newOwer) public onlyOwner {
        owner = newOwer;
    }
}