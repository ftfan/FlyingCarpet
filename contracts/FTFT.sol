pragma solidity ^0.4.11;

contract ImconfigFTFT {
    string public constant name = "ImconfigFTFT";
    string public constant symbol = "ftft";
    uint8 public constant decimals = 9;
    uint256 _totalSupply = 10000000000000;
    mapping(address => uint256) balances;
    address public owner;
    mapping(address => mapping (address => uint256)) allowed;

    event Transfer(address _from, address _to, uint _value);
    event Approval(address _owner, address _spender, uint _value);

    // 总量
    function totalSupply() public view returns (uint theTotalSupply) {
        theTotalSupply = _totalSupply;
        return theTotalSupply;
    }

    // 查询余额
    function balanceOf(address _owner) public view returns (uint balance) {
      return balances[_owner];
    }

    // 转账
    function transfer(address _to, uint _value) public returns (bool success) {
        address _from = msg.sender;
        uint256 balance = balances[_from];
        uint256 toBalance = balances[_to];
        if (balance < _value) return false; // 余额不足
        if (0 >= _value) return false; // 转账金额错误
        if (toBalance + _value <= toBalance) return false; // 金额溢出

        // 执行转账
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    // 授权转账执行
    function transferFrom(address _from, address _to, uint _value) public returns (bool success) {
        uint256 balance = balances[_from];
        uint256 toBalance = balances[_to];
        if (balance < _value) return false; // 余额不足
        if (0 >= _value) return false; // 转账金额错误
        if (toBalance + _value <= toBalance) return false; // 金额溢出
        if (allowed[_from][msg.sender] < _value) return false; // 授权额度不足

        // 执行转账
        balances[_from] -= _value;
        balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    // 授权
    function approve(address _spender, uint _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // 查询授数量
    function allowance(address _owner, address _spender) public view returns (uint remaining) {
        return allowed[_owner][_spender];
    }
}