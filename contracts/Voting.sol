// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @author Leandro
 * @title Voting
 * @notice A simple contract for voting with a list of candidates and a counter for each vote received.
 */
contract Voting {
    
    using Counters for Counters.Counter;

    mapping (bytes32 => Counters.Counter) public VotedReceived;

    bytes32[] public candidateList;

    constructor() {
        candidateList.push(bytes32("Alicia"));
        candidateList.push(bytes32("Leandro"));
        candidateList.push(bytes32("Juan"));
    }
    
    /**
     * @notice Increments the vote counter for a candidate.
     * @param candidate The name of the candidate.
     */
    function incrementVoted(bytes32 candidate) public{
        require(validCandidate(candidate));
        VotedReceived[candidate].increment();
    }

    /**
     * @notice Gets the current vote count for a candidate.
     * @param candidate The name of the candidate.
     * @return The current vote count.
     */
    function getVotedReceived(bytes32 candidate) view public returns (uint) {
        require(validCandidate(candidate));
        return VotedReceived[candidate].current();
    }
    /**
     * @notice Checks if a candidate is valid.
     * @param candidate The name of the candidate.
     * @return true if the candidate is valid, false otherwise.
     */
    function validCandidate(bytes32 candidate) public view returns (bool){
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
            
        }
        return false;
    }

}
