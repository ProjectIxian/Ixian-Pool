<section class="content container-fluid">
    
    <?php for($i = 0; $i < $this->noticecount; $i++) { ?>
    <div class="callout <?php echo $this->notices[$i]["warning"]; ?>">
          <p><?php echo $this->notices[$i]["message"]; ?></p>
    </div>
    <?php }
    ?>
    
    <div class="row">
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fa fa-th"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Node block height</span>
                    <span class="info-box-number">
                        <?php echo $this->nodeBlockHeight; ?>
                    </span>
                </div>
            </div>      
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fa fa-th"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Currently mining block</span>
                    <span class="info-box-number">
                        <?php echo $this->blockheight;?>
                    </span>
                </div>
            </div>      
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fas fa-gem"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Block Reward</span>
                    <span class="info-box-number"><?php echo $this->reward;?> IXI</span>
                </div>
            </div>      
        </div>
     
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-blue"><i class="fa fa-users"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Connected Miners</span>
              <span class="info-box-number"><?php echo $this->minercount; ?> (<?php echo $this->workercount;?> workers)</span>
            </div>
          </div>
        </div>
    
    
         <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-percent"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Pool Fee</span>
              <span class="info-box-number"><?php echo $this->percent;?> %</span>
            </div>
          </div>
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="far fa-clock"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Payment Interval</span>
              <span class="info-box-number">1 hour</span>
            </div>
          </div>
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="far fa-money-bill-alt"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">Total Payments</span>
              <span class="info-box-number"><?php echo $this->totalpaid;?> IXI</span>
            </div>
          </div>
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fa fa-chart-bar"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Pool Difficulty</span>
                    <span class="info-box-number"><?php echo $this->difficulty;?></span>
                </div>
            </div>      
        </div>
        
        <div class="col-md-4 col-sm-6 col-xs-12">
            <div class="info-box">
                <span class="info-box-icon bg-blue"><i class="fa fa-bolt"></i></span>

                <div class="info-box-content">
                    <span class="info-box-text">Pool Hashrate</span>
                    <span class="info-box-number"><?php echo $this->hashrate;?></span>
                </div>
            </div>
        </div>
    </div>
    
      <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-body" style="">                                                  
                    <h3>How do I get started?</h3>
                    <p>
                        You'll need an Ixian Wallet Address and Ixian mining software.<br/>
                        The fastest way to get the wallet address is by using <a href="https://www.spixi.io" target="_blank">Spixi</a> or <a href="https://github.com/ProjectIxian/Ixian-LiteWallet/releases" target="_blank">Ixian LiteWallet</a>.<br/>
                        <strong>Remember to backup your wallet!</strong><br/>
                        You can choose most suitable mining software for you below. If you're new, we recommend using IxiWatt Easy Miner.<br/>
                    </p>
                    
                    <strong>Pool Address: </strong><?php echo $this->pool_url; ?><br/>
                    <br/>

                    <h4>IxiWatt Easy Miner for Windows</h4>
                    <p>Latest release of IxiWatt can be found on <a href="https://github.com/ProjectIxian/IxiWatt/releases" target="_blank">https://github.com/ProjectIxian/IxiWatt/releases</a>.</p>
                    <br/>
                    
                    <h4>Official CPU only miner</h4>
                    <p>Latest release of Official CPU miner can be found on <a href="https://github.com/ProjectIxian/Ixian-Miner/releases" target="_blank">https://github.com/ProjectIxian/Ixian-Miner/releases</a>.</p>
                    <dl class="dl-horizontal">
                        <dt>IxianMiner command</dt>
                        <dd>IxianMiner.exe --pool <?php echo $this->pool_url; ?> --wallet YOUR_WALLET --worker YOUR_WORKERNAME</dd>
                    </dl>
                    <p>Make sure you replace YOUR_WALLET with your Ixian wallet address and YOUR_WORKERNAME with a name for your mining rig.</p>

                    <strong>Failover Configuration</strong>  

                    <p>To add a second Ixian Pool as Failover, simply add --pool2 "FAILOVER POOL ADDRESS" to your IxianMiner command. For example: --pool2 https://ixian.kiramine.com</p>
                    <br/>
                    
                    <h4>CPU/GPU Miner made by Bogdan Adnan</h4>

                    <p>Latest release of Bogdan Adnan's Ixian miner and instructions can be found on <a href="https://github.com/bogdanadnan/iximiner/releases" target="_blank">https://github.com/bogdanadnan/iximiner/releases</a>.</p>
                    <br/>
                    
                    <h3>Contact</h3>
                    <p>Support for the pool is offered on the <a href="https://discord.gg/P493UN9" target="_blank">Ixian discord channel</a>.</p>
                </div>

            </div>
            
          </div>
    </div>
    
    
</section>