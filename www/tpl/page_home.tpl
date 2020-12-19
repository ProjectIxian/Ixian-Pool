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
                    <span class="info-box-text">Currently mining block</span>
                    <span class="info-box-number">
						<?php echo $this->blockheight;?>
					</span>
                </div>
            </div>      
        </div>
        
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
                    <span class="info-box-number"><?php echo $this->hashrate;?> h/s</span>
                </div>
            </div>      
        </div>  
        


  

        
        
        
    </div>
    
      <div class="row">
        <div class="col-xs-12">

            
            
            <div class="box">
                <div class="box-body" style="">                                                  
                    <h3>How do I get started?</h3>
                    <p>Create an Ixian wallet if you don't have one already by using the <a href="https://github.com/ProjectIxian/Ixian-LiteWallet/releases" target="_blank">Ixian LiteWallet</a>. Then <a href="https://github.com/ProjectIxian/Ixian-Miner/releases" target="_blank">download the IxianMiner</a> software to connect to this pool.</p>     
                    
					<h3>Connection Details</h3>

					
					<h4>Official CPU only miner</h4>

					  <dl class="dl-horizontal">
						<dt>Pool Address</dt>
						<dd><?php echo $pool_url; ?></dd>
						<dt>IxianMiner command</dt>
						<dd>IxianMiner.exe --pool <?php echo $pool_url; ?> --wallet YOUR_WALLET --worker YOUR_WORKERNAME</dd>
					  </dl>
					  <p>Make sure you replace YOUR_WALLET with your Ixian wallet address and YOUR_WORKERNAME with a name for your mining rig.</p>
					  
					<h4>Failover Configuration</h4>
					  
					<p>To add a second IxianPool as Failover, simply add --pool2 "FAILOVER POOL ADDRESS" to your IxianMiner command. For example: --pool2 https://ixian.kiramine.com</p>
                    
					<h4>GPU Miner made by Bogdanadnan</h4>
					
					<p>The latest release of Bogdanadnan's Ixian GPU miner for AMD and NVIDIA cards and Linux as Windows build you will find here <a href="https://github.com/bogdanadnan/iximiner/releases" target="_blank">AMD/NVIDIA GPU Miner</a></p>
					<p>You will also find there all necessary informations on how to set it up</p>
					
					<h3>Contact</h3>
					<p>Support for the pool is offered on the <a href="https://discord.gg/P493UN9" target="_blank">Ixian discord channel<a/>.</p>
                </div>

            </div>
            
          </div>
    </div>
    
    
</section>