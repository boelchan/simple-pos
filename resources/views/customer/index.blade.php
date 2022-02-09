@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card" style="min-height: 85vh">
                <div class="card-header bg-white">
                    <form action="{{ route('customer.index') }}" method="get">
                        <div class="row">  
                            <div class="col"><h4 class="font-weight-bold">Customers</h4></div>
                            <div class="col"><input type="text" name="search"
                                    class="form-control form-control-sm col-sm-10 float-right"
                                    placeholder="Search customer..." onblur="this.form.submit()"></div>
                            <div class="col-sm-2"><a href="{{ url('/customer/create')}}"
                                    class="btn btn-primary btn-sm float-right btn-block">Add customer</a></div>
                        </div>
                    </form>
                </div>
                <div class="card-body">
                    @if(Session::has('success'))
                    @include('layouts.flash-success',[ 'message'=> Session('success') ])
                    @endif
                    <div class="row">
                        @foreach ($customers as $customer)
                        <div class="col-sm-3">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <h5 class="card-title text-center font-weight-bold"
                                        style="text-transform: capitalize;">
                                        {{ $customer->nama }}</h5>
                                        <p>{{ $customer->alamat }}</p>
                                    <a href="{{ route('customer.edit', $customer->id) }}"
                                        class="btn btn-primary btn-block btn-sm">Details</a>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
                <div>{{ $customers->links() }}</div>
            </div>
        </div>
    </div>
    @endsection

    @push('style')
    <style>
        .gambar {
            width: 100%;
            height: 175px;
            padding: 0.9rem 0.9rem
        }

        @media only screen and (max-width: 600px) {
            .gambar {
                width: 100%;
                height: 100%;
                padding: 0.9rem 0.9rem
            }
        }

    </style>
    @endpush