pragma solidity ^0.4.11;

import "./SafeMath.sol";

contract Voting {
    using SafeMath for uint;

    mapping (bytes32 => uint ) public votesReceived;
    mapping (address => bool) private addrRecoded;

    bytes32[] public candidateList;

    constructor(bytes32[] memory candidateNames) public {
      candidateList = candidateNames;
    }

    function totalVotesFor(bytes32 candidate) public view returns (uint) {
        require(validCandidate(candidate), "validCandidate(candidate)");
        return votesReceived[candidate];
    }

    function voteForCandidate(bytes32 candidate) public payable {
      require(validCandidate(candidate), "");
      require(!addrRecoded[msg.sender], "");
      addrRecoded[msg.sender] = true;

      uint m = msg.value / 0.1 ether;

      votesReceived[candidate] = votesReceived[candidate].add(m);
    }

    function validCandidate(bytes32 candidate) public view returns (bool){
      for (uint i = 0 ; i < candidateList.length; i++) {
        if (candidateList[i] == candidate) {
          return true;
        }
      }
      return false;
    }
}