//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Test,console} from "forge-std/Test.sol";
import {DeployMoodNft} from "./../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test{
    DeployMoodNft public deployer;
    // address public USER = makeAddr('user');
    function setUp() public{
        deployer = new DeployMoodNft();

    }
    function testConvertSvgToUri() public view{

        string memory expectedUri= "data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48dGV4dCB4PSIxMCIgeT0iNDAiIGZvbnQtZmFtaWx5PSJBcmlhbCIgZm9udC1zaXplPSIyMCIgZmlsbD0iYmxhY2siPkhlbGxvLCBTVkchPC90ZXh0Pjwvc3ZnPg==";
        string memory svg='<svg width="200" height="100" xmlns="http://www.w3.org/2000/svg"><text x="10" y="40" font-family="Arial" font-size="20" fill="black">Hello, SVG!</text></svg>';
        string memory actualUri= deployer.svgToImageUri(svg);
        console.log("Expected URI:", expectedUri);
        console.log("Actual URI:", actualUri);

        assert(keccak256(abi.encodePacked(expectedUri))==
        keccak256(abi.encodePacked(actualUri)));
    }


}