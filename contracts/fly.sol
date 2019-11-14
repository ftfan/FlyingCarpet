pragma solidity ^0.4.11;
import "./owned.sol";
import "./vote.sol";

contract ImconfigToken is owned, vote {
    uint256 public assetid = 0; // 当前合约控制的资产ID
    uint constant DAY_IN_SECONDS = 86400;
    uint constant DAY_EARLY_BIRD = 30; // 设置前30天为早鸟期
    uint public earlyBirdSupply = 0; // 早鸟期间释放量记录
    uint public FT_ASSET_ID = 0; // FT 的资产ID

    event AddSupply(address to, uint value);
    event DelSupply(address to, uint value);

    // 管理者，可以设置当前合约管理的资产
    function setAssetIdByName(string name) public onlyOwner {
        require(assetid == FT_ASSET_ID, "current assetid error");
        assetid = uint256(getassetid(name));
    }

    // 外部测试使用。暂无用途
    function getAssetIdByName(string name) public view returns(uint256) {
        return uint256(getassetid(name));
    }

    // 发行/兑换资产
    function addSupply () public payable {
        require(msg.assetid == FT_ASSET_ID, "need: ft"); // 非FT资产，不执行
        uint256 _value = msg.value / (10 ** 18); // 合约管理的资产，精度为0
        require(_value > 0, "need: _value > 0");
        uint256 toBalance = msg.sender.balanceex(assetid);
        require(toBalance + _value > toBalance, "need: toBalance + _value > toBalance"); // 金额溢出
        msg.sender.transfer(assetid, _value);
        earlyBirdSupply += _value;
        emit AddSupply(msg.sender, _value);
    }

    // 提现、离场操作
    function delSupply () public payable {
        require(msg.assetid == assetid, "need: current assetid"); // 非当前协议资产，不执行
        uint256 _value = msg.value * (10 ** 18); // 合约管理的资产，精度为0
        require(_value > 0, "need: _value > 0");
        msg.sender.transfer(FT_ASSET_ID, _value);
        earlyBirdSupply -= _value;
        emit DelSupply(msg.sender, _value);
    }
}