pragma solidity ^0.8.13;

contract Voting {
  
  // candidate name stored as bytes32 and the total votes as uint256
  mapping (bytes32 => uint256) public votesReceived;
  bytes32[] public candidateList;

  // Constructor (called only once)
  constructor(bytes32[] memory candidateNames) public {
    candidateList = candidateNames;
  }

  // Total votes for candidate
  function totalVotesFor(bytes32 candidate) view public returns (uint256) {
    require(validCandidate(candidate));
    return votesReceived[candidate];
  }

  // Cast a vote
  function voteForCandidate(bytes32 candidate) public {
    require(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  // Checks if allowed to vote
  function validCandidate(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++)
      if (candidateList[i] == candidate) 
        return true;
    return false;
  }
}








