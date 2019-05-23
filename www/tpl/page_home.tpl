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
                    <span class="info-box-text">Block Height</span>
                    <span class="info-box-number"><?php echo $this->blockheight;?></span>
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
                    <h3>What is Ixian Pool?</h3>
                    <p>Coming soon.</p>
                                                  
                    <h3>How do I get started?</h3>
                    <p>Instructions coming soon.</p>     
                    
                    
                </div>

            </div>
            
          </div>
    </div>
    
    
</section>