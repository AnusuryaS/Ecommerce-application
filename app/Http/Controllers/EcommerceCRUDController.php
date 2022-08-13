<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EcommerceCRUDController extends Controller
{
  public function index()
  {
    $ecommerces = Ecommerce::all();
    return view ('ecommerces.index')->with('ecomerces', $ecommerces);
  }
  public function create()
  {
   return view('ecommerces.create');
  }
  public function store(Request $request)
  {
    $input = $request->all();
    Ecommerce::create($input);
    return redirect('ecommerce')->with('flash_message', 'Student Addedd!');
  }
  public function show(Ecommerce $ecommerces)
  {
    $ecommerce = Ecommerce::find($id);
    return view('students.show')->with('ecommerces', $ecommerce);
  } 
  public function edit(Ecommerce $ecommerce)
  {
    $ecommerce = Ecommerce::find($id);
    return view('ecommerces.edit')->with('ecommerces', $ecommerce);
  }

  public function update(Request $request, $id)
  {
    $ecommerce = Ecommerce::find($id);
    $input = $request->all();
    $ecommerce->update($input);
    return redirect('ecommerce')->with('flash_message', 'product Updated!');  
  }
  public function destroy(Ecommerce $ecommerce)
  {
    Ecommerce::destroy($id);
    return redirect('ecommerce')->with('flash_message', 'product deleted!'); 
  }
}
