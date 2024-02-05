//SPDX-License-Identifier : MIT
pragma solidity ^0.8.19;
import "../src/BasicNft.sol";
import {Script} from "forge-std/Script.sol";
contract DeployBasicNft is Script {



    function run() external returns (BasicNft){
        vm.startBroadcast();
        BasicNft basicNft= new BasicNft();
        vm.stopBroadcast();
        return basicNft;
    }

}