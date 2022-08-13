<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Product list</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
</head>
<body>
<div class="container mt-2">
<div class="row">
<div class="col-lg-12 margin-tb">
<div class="pull-left">
<h2>Product List</h2>
</div>
<div class="pull-right mb-2">
<a class="btn btn-success" href="{{ route('ecommerces.create') }}"> Create Product</a>
</div>
</div>
</div>
@if ($message = Session::get('success'))
<div class="alert alert-success">
<p>{{ $message }}</p>
</div>
@endif
<table class="table table-bordered">
<tr>
<th>S.No</th>
<th>Product Name</th>
<th>Product Description</th>
<th>Price</th>
<th>Product quantity</th>
<th width="280px">Action</th>
</tr>
@foreach ($ecommerces as $ecommerce)
<tr>
<td>{{ $ecommerce->id }}</td>
<td>{{ $ecommerce->product_name }}</td>
<td>{{ $ecommerce->product_desc}}</td>
<td>{{ $ecommerce->price }}</td>
<td>{{ $ecommerce->Product_quantity }}</td>
<td>
<form action="{{ route('ecommerces.destroy',$ecommerce->id) }}" method="Post">
<a class="btn btn-primary" href="{{ route('ecommerces.edit',$ecommerce->id) }}">Edit</a>
@csrf
@method('DELETE')
<button type="submit" class="btn btn-danger">Delete</button>
</form>
</td>
</tr>
@endforeach
</table>
{!! $ecommerces->links() !!}
</body>
</html>