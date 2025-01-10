//SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol";

contract ElectroV2Helper {
    IUniswapV2Router02 public router =
        IUniswapV2Router02(0x072D4706f9A383D5608BD14B09b41683cb95fFd7);
    IUniswapV2Factory public factory =
        IUniswapV2Factory(0x203D550ed6fA9dAB8A4190720CF9F65138abd15B);

    address public DEAD_ADDRESS = 0x000000000000000000000000000000000000dEaD;
    address public NULL_ADDRESS = address(0);

    function createPair(address token) internal returns (address pairAddress) {
        return
            IUniswapV2Factory(router.factory()).createPair(
                router.WETH(),
                token
            );
    }

    function getPath(address token)
        internal
        view
        returns (address[] memory path)
    {
        path = new address[](2);
        path[0] = router.WETH();
        path[1] = token;
    }

    function getReversePath(address token)
        internal
        view
        returns (address[] memory path)
    {
        path = new address[](2);
        path[0] = token;
        path[1] = router.WETH();
    }

    function getMultiPath(address tokenFrom, address tokenTo)
        internal
        view
        returns (address[] memory path)
    {
        path = new address[](3);
        path[0] = tokenFrom;
        path[1] = router.WETH();
        path[2] = tokenTo;
    }
}
