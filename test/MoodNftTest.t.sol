//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Test,console} from "forge-std/Test.sol";
import {MoodNft} from "./../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNftTest is Test{
    MoodNft public moodNft;
    address public USER = makeAddr('user');

    string public constant HAPPY_SVG_URI="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgc3Ryb2tlPSJncmVlbiIgc3Ryb2tlLXdpZHRoPSI0IiBmaWxsPSJ5ZWxsb3ciIC8+Cjwvc3ZnPg==";
    string public constant SAD_SVG_URI="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KICA8Y2lyY2xlIGN4PSI1MCIgY3k9IjUwIiByPSI0MCIgc3Ryb2tlPSJncmVlbiIgc3Ryb2tlLXdpZHRoPSI0IiBmaWxsPSJyZWQiIC8+Cjwvc3ZnPg==";
    string public constant HAPPY_TOKEN_URI="data:application/json;base64,eyAibmFtZSI6ICJNb29kTmZ0IiwgImRlc2NyaXB0aW9uIjogIkEgdG9rZW4gdGhhdCByZXByZXNlbnRzIHRoZSBtb29kIG9mIHRoZSBvd25lciIsICJhdHRyaWJ1dGVzIjogW3sidHJhaXRfdHlwZSI6ICJtb29kaW5lc3MiLCAidmFsdWUiOiAxMDB9XSwgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjNhV1IwYUQwaU1UQXdJaUJvWldsbmFIUTlJakV3TUNJZ2VHMXNibk05SW1oMGRIQTZMeTkzZDNjdWR6TXViM0puTHpJd01EQXZjM1puSWo0S0lDQThZMmx5WTJ4bElHTjRQU0kxTUNJZ1kzazlJalV3SWlCeVBTSTBNQ0lnYzNSeWIydGxQU0puY21WbGJpSWdjM1J5YjJ0bExYZHBaSFJvUFNJMElpQm1hV3hzUFNKNVpXeHNiM2NpSUM4K0Nqd3ZjM1puUGc9PSJ9";
    string public constant SAD_TOKEN_URI="data:application/json;base64,eyAibmFtZSI6ICJNb29kTmZ0IiwgImRlc2NyaXB0aW9uIjogIkEgdG9rZW4gdGhhdCByZXByZXNlbnRzIHRoZSBtb29kIG9mIHRoZSBvd25lciIsICJhdHRyaWJ1dGVzIjogW3sidHJhaXRfdHlwZSI6ICJtb29kaW5lc3MiLCAidmFsdWUiOiAxMDB9XSwgImltYWdlIjogImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjNhV1IwYUQwaU1UQXdJaUJvWldsbmFIUTlJakV3TUNJZ2VHMXNibk05SW1oMGRIQTZMeTkzZDNjdWR6TXViM0puTHpJd01EQXZjM1puSWo0S0lDQThZMmx5WTJ4bElHTjRQU0kxTUNJZ1kzazlJalV3SWlCeVBTSTBNQ0lnYzNSeWIydGxQU0puY21WbGJpSWdjM1J5YjJ0bExYZHBaSFJvUFNJMElpQm1hV3hzUFNKeVpXUWlJQzgrQ2p3dmMzWm5QZz09In0=";

    function setUp() public{
         moodNft = new MoodNft(SAD_SVG_URI,HAPPY_SVG_URI);
    }
    function testTokenUriIsCorrect() external{
        vm.prank(USER);
        moodNft.mintNft();
        string memory data= moodNft.tokenURI(0);




    }
    function testflipMood() public{

        vm.prank(USER);
        moodNft.mintNft();

        moodNft.flipMood(0);
        string memory actualURI=moodNft.tokenURI(0);
        console.log("expected",SAD_TOKEN_URI);
        assertEq(actualURI,expectedURI);
        assert(moodNft.getTokenIdToMood(0)==MoodNft.Mood.SAD);

    }



}