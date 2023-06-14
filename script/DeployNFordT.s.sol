// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {NFordT} from "../src/NFordT.sol";

contract DeployNFordT is Script {
    function run() external returns (NFordT) {
        vm.startBroadcast();
        NFordT nFordT = new NFordT();
        vm.stopBroadcast();
        return nFordT;
    }
}
