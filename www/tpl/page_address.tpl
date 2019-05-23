<div class="container">
    <section class="content-header" style="word-break: break-all;">
      <h1>
        <small>Wallet Address</small><br/>
        <?php echo $this->address;?><br/>
        <small>
            [<a target="_blank" href="https://explorer.ixian.io/?page=&address=<?php echo $this->address;?>">View in Explorer</a>]</small>
          
      </h1>
    </section>
        
<section class="content container-fluid">

    <div class="row">
        <div class="col-lg-3 col-sm-6 col-xs-12">
          
          <div class="small-box bg-green">
            <div class="inner">
                <p>Total Paid</p>
                
                <h2><?php echo $this->totalpaid;?></h2>
                
            </div>
            <div class="icon">
              <i class="far fa-money-bill-alt"></i>
            </div>
          </div>
        </div>
        
        
        <div class="col-lg-3 col-sm-6 col-xs-12">
          
          <div class="small-box bg-aqua">
            <div class="inner">
                <p>Estimated Payout</p>

                <h2><?php echo $this->pending;?></h2>
                
            </div>
            <div class="icon">
              <i class="fas fa-hourglass-half"></i>
            </div>
          </div>
        </div>
        
        
        <div class="col-lg-3 col-sm-6 col-xs-12">
          
          <div class="small-box bg-yellow">
            <div class="inner">
                <p>Total Hashrate</p>
                <h2><?php echo $this->hashrate;?></h2>

              
            </div>
            <div class="icon">
              <i class="fa fa-bolt"></i>
            </div>
          </div>
        </div>
        
        
        <div class="col-lg-3 col-sm-6 col-xs-12">
          
          <div class="small-box bg-red">
            <div class="inner">
                <p>Active Workers</p>
                <h2><?php echo $this->workercount;?></h2>             
            </div>
            <div class="icon">
              <i class="fas fa-cogs"></i>
            </div>
          </div>
        </div>
              
        
    </div>
    <div class="row">
        
    <div class="box box-danger">
          <div class="box-header with-border">
            <h3 class="box-title">Workers</h3>
          </div>
          <div class="box-body">
            <div class="box-body" style="height: 250px;">
              <table id="tworkers" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Name</th>
                  <th>Hash Rate</th>
                  <th>Last seen</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                
                </table>
            </div>
              
        </div>
    </div>
    
        
    <div class="box box-success">
          <div class="box-header with-border">
            <h3 class="box-title">Payments</h3>
          </div>
          <div class="box-body">
            <div class="box-body" style="height: 350px;">
              <table id="tpayments" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Date</th>
                  <th>Value</th>
                  <th>TXID</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                
                </table>
            </div>
        </div>
    </div>
          
    
    </div>
         
      <div class="row">            
            <div class="box">
                <div class="box-body" style="">
                    <h3></h3>
                    
                    <dl class="dl-horizontal">
                        <dt>Total Paid</dt>
                        <dd>Shows the sum of all payments made to this address.</dd>
                        <dt>Estimated Payout</dt>
                        <dd>Shows the estimated next payment amount which will be made.</dd>
                        <dt>Total Hashrate</dt>
                        <dd>Shows the sum of all active workers hashrate.</dd>
                        <dt>Active Workers</dt>
                        <dd>Shows the amount of workers for this address active in the last 24 hours.</dd>
                    </dl>
                    
                </div>

            </div>
    </div>
    
    
</section>
    
    
    
</div>


<script src="components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script>
    var etbl;
    $(function () {
        $etbl = $('#tworkers').DataTable({
            'paging' : true,
            'lengthChange' : false,
            'info' : false,
            'ordering' : true,
            'searching' : false,
            'serverSide' : true,
            'processing' : true,
            'autoWidth': false,
            'ajax' : 'feed/workers.php?address=<?php echo $this->address;?>'
        });
    })

    var etbl2;
    $(function () {
        $etbl2 = $('#tpayments').DataTable({
            'paging' : true,
            'lengthChange' : false,
            'info' : false,
            'ordering' : true,
			'order': [[ 0, "desc" ]],
            'searching' : true,
            'serverSide' : true,
            'processing' : true,
            'autoWidth': false,
            'ajax' : 'feed/payments.php?address=<?php echo $this->address;?>'
        });
    })    
    
</script>