// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.18;

import "@openzeppelin/contracts/utils/Counters.sol";

contract Voting {
    
    using Counters for Counters.Counter;
    
    mapping (bytes32 => Counters.Counter) public VotedReceived;

    bytes32[]public candidateList;

    constructor(bytes32[]  memory candidateNames) {
        candidateList = candidateNames;
    }

    function incrementVoted(bytes32 candidate) public{
        require(validCandidate(candidate));
        VotedReceived[candidate].increment();
    }

    function getVotedReceived(bytes32 candidate) view public returns (uint) {
        require(validCandidate(candidate));
        return VotedReceived[candidate].
current
();
    }

    function validCandidate(bytes32 candidate) public view returns (bool){
        for (uint i = 0; i < candidateList.length; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
            
        }
        return false;
    }

}