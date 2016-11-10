
<!-- Static navbar -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">< SILAKOP > </a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      
      <ul class="nav navbar-nav navbar-right">
        <li class="{{url()->full() == url('dasboard') ? 'active': ''}}"><a  href="{{url('dasboard')}}">Dasboard</a></li>
        <li class="{{url()->full() == url('laporan') ? 'active' : ''}}"><a href="{{url('laporan')}}">Laporan</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Simpanan <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li class="{{url()->full() == url('pokok') ? 'active': ''}}"><a href="{{url('pokok')}}">Simpanan Pokok</a></li>
            <li><a href="#">Simpanan Wajib</a></li>            
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Jurnal <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li class="{{url()->full() == url('jurnal_umum') ? 'active': ''}}"><a href="{{url('jurnal_umum')}}">Jurnal Umum</a></li>
            <li><a href="#">Jurnal Penerimaan Kas</a></li>            
          </ul>
        </li>
      </ul>
    </div><!--/.nav-collapse -->
  </div><!--/.container-fluid -->
</nav>