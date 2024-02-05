//SPDX-License_Identifier: MIT
pragma solidity ^0.8.19;
import {DeployBasicNft} from "./../script/DeployBasicNft.s.sol";
import {BasicNft} from "./../src/BasicNft.sol";
import {Test} from "forge-std/Test.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr('user');
    string public constant CAT="http://bafybeidmatahenkij4qsjdk54obpnpukf25hx65wzpoixeol7pgqdyh75y.ipfs.localhost:8080/?filename=cataconical.json";
    function setUp() public{
        deployer = new DeployBasicNft();
        basicNft= deployer.run();



    }
    function testNameIsCorrect() public view{
        string memory expected="StarWars";
        string memory actual= basicNft.name();
        bytes32 expectedHash =keccak256(abi.encodePacked(expected));
        bytes32 actualHash =keccak256(abi.encodePacked(actual));
        assert(expectedHash==actualHash);


    }
    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(CAT);
        assert(basicNft.balanceOf(USER)==1);
        bytes32 expectedCatHash= keccak256(abi.encodePacked(CAT));
        bytes32 actualCatHash= keccak256(abi.encodePacked(basicNft.tokenURI(0)));
        assert(expectedCatHash==actualCatHash);



    }


   
     
}