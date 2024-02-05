//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {console} from "forge-std/Test.sol";


contract DeployMoodNft is Script{

    string  public HAPPY_IMAGE_URI="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgc3Ryb2tlPSJncmVlbiIgc3Ryb2tlLXdpZHRoPSI0IiBmaWxsPSJ5ZWxsb3ciIC8+Cjwvc3ZnPg==";
    string  public SAD_IMAGE_URI="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgc3Ryb2tlPSJncmVlbiIgc3Ryb2tlLXdpZHRoPSI0IiBmaWxsPSJyZWQiIC8+Cjwvc3ZnPg==";




    function run() external returns (MoodNft){
        string memory sadSvg= vm.readFile("./img/sad.svg");
        string memory happySvg= vm.readFile("./img/happy.svg");
        vm.startBroadcast();
        MoodNft moodNft= new MoodNft(svgToImageUri(sadSvg),svgToImageUri(happySvg));
        vm.stopBroadcast();
        return moodNft;

    }
    function svgToImageUri(string memory svg) public view returns (string memory){
        string memory baseURL= "data:image/svg+xml;base64,";
        string memory svgBase64Encoded= Base64.encode(bytes(string(abi.encodePacked(svg))));
        // console.log(string(abi.encodePacked(baseURL,svgBase64Encoded)));

        return string(abi.encodePacked(baseURL,svgBase64Encoded));


    }

}