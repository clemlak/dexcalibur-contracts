pragma solidity 0.5.7;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";


contract TestToken is ERC20, ERC20Detailed {
    constructor() public ERC20Detailed(
        "TestToken",
        "TT",
        18
    ) {
        _mint(msg.sender, 42 * 10 ** 18);
    }
}
