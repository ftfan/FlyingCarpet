pragma solidity ^0.4.11;

contract vote {
    // allowed保存每个地址（第一个address） 授权给其他地址(第二个address)的额度（uint256）
    mapping(address => mapping(address => uint256)) voteAllowed;

    event VoteApproval(address sender, address spender, uint256 value);

    function voteApprove(address _spender, uint256 _value) public returns (bool success) {
        voteAllowed[msg.sender][_spender] = _value;
        emit VoteApproval(msg.sender, _spender, _value);
        return true;
    }

    function voteAllowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return voteAllowed[_owner][_spender];
    }
}