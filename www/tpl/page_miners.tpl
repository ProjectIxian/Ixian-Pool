<div class="container">
    <section class="content-header">
      <h1>        
        <small></small>
      </h1>
    </section>
        
<section class="content container-fluid">

<div class="row">
    <div class="box box-info">
          <div class="box-header with-border">
            <h3 class="box-title">Miners</h3>
          </div>
          <div class="box-body">
            <div class="box-body" style="height: 250px;">
              <table id="tminers" class="table table-bordered table-hover" style="word-break: break-all;">
                <thead>
                <tr>
                  <th>Address</th>
                  <th>Round Shares</th>
                  <th>Last Share</th>
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
                        <dt>Information</dt>
                        <dd>This page shows all the miners on the pool that submitted at least one share in the last 48 hours.</dd>
                        <dt></dt>
                        <dd>Make sure you submit at least one share for your address to be visible here.</dd>
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
        $etbl = $('#tminers').DataTable({
            'paging' : true,
            'lengthChange' : false,
            'info' : false,
            'ordering' : true,
			'order': [[ 1, "desc" ]],
            'searching' : false,
            'serverSide' : true,
            'processing' : true,
            'autoWidth': false,
            'ajax' : 'feed/miners.php'
        });
    }) 
    
</script>