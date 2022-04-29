pragma solidity ^0.8.13;

contract SimpleContract {
  
  // candidate name stored as bytes32 and the total votes as uint256
  mapping (bytes32 => uint256) public votesReceived;
  bytes32[] public candidates;

  // Constructor (called only once)
  constructor(bytes32[] memory nameList) public {
    candidates = nameList;
  }

  // Total votes for candidate
  function sumVotes(bytes32 candidate) view public returns (uint256) {
    require(isAllowed(candidate));
    return votesReceived[candidate];
  }

  // Cast a vote
  function addVote(bytes32 candidate) public {
    require(isAllowed(candidate));
    votesReceived[candidate] += 1;
  }

  // Checks if allowed to vote
  function isAllowed(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidates.length; i++)
      if (candidates[i] == candidate) 
        return true;
    return false;
  }
}








