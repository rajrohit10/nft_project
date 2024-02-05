//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintBasicNft is Script{
    string public constant CAT="https://ipfs.io/ipfs/QmVcJwfimXZ133fiFb2REg3xysDjnbGwPntb47vZym3zwX?filename=cataconical.json";


    function run() external {
        address mostRecentDeployed= DevOpsTools.get_most_recent_deployment("BasicNft", block.chainid);
        mintNftOnContract(mostRecentDeployed);



    }
    
    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(CAT);
        vm.stopBroadcast();
    }



}

contract MintMoodNft is Script{
     
     function run () external {
        address mostRecentDeployed= DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintMoodNftOnContract(mostRecentDeployed);
     }
     function mintMoodNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNft();
        vm.stopBroadcast();

     }
}