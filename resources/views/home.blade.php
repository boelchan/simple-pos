@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card" style="min-height: 85vh">
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <h3 class="text-center">Selamat Datang di aplikasi POS</h3>
                    <h1 class="text-center">Sumenep Digital Print</h1>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection