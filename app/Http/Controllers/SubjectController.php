<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Subject;
class SubjectController extends Controller
{
    public function index(){
return response()->json(Subject::all());
}
}
