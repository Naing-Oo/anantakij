<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CatcherTeam;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;

class CatcherTeamController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('catcher_team')) {
            $catcher_team_all = CatcherTeam::where('is_active', true)->get();
            return view('catcher.create',compact('catcher_team_all'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('catcher_teams')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);
        $catcher_team_data = $request->all();
        $catcher_team_data['is_active'] = true;
        CatcherTeam::create($catcher_team_data);
        return redirect('catcher_team')->with('message', 'Data inserted successfully');
    }

    public function edit($id)
    {
        $catcher_team_data = CatcherTeam::find($id);
        return $catcher_team_data;
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('catcher_teams')->ignore($request->catcher_team_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);

        $input = $request->all();
        $catcher_team_data = CatcherTeam::find($input['catcher_team_id']);

        $catcher_team_data->update($input);
        return redirect('catcher_team')->with('message', 'Data updated successfully');
    }

    public function exportCatcherTeam(Request $request)
    {
        $catcher_team_data = $request['catcher_teamArray'];
        $csvData=array('name, description, commission_rate, percentage');
        foreach ($catcher_team_data as $catcher_team) {
            if($catcher_team > 0) {
                $data = CatcherTeam::where('id', $catcher_team)->first();
                $csvData[]=$data->name. ',' . $data->description . ',' . $data->commission_rate . ',' . $data->percentage;
            }   
        }        
        $filename="catcher_team- " .date('d-m-Y').".csv";
        $file_path=public_path().'/downloads/'.$filename;
        $file_url=url('/').'/downloads/'.$filename;   
        $file = fopen($file_path,"w+");
        foreach ($csvData as $exp_data){
          fputcsv($file,explode(',',$exp_data));
        }   
        fclose($file);
        return $file_url;
    }

    public function deleteBySelection(Request $request)
    {
        $catcher_team_id = $request['catcher_teamIdArray'];
        foreach ($catcher_team_id as $id) {
            $catcher_team_data = CatcherTeam::find($id);
            $catcher_team_data->is_active = false;
            $catcher_team_data->save();
        }
        return 'Customer Group deleted successfully!';
    }

    public function destroy($id)
    {
        $catcher_team_data = CatcherTeam::find($id);
        $catcher_team_data->is_active = false;
        $catcher_team_data->save();
        return redirect('catcher_team')->with('not_permitted', 'Data deleted successfully');
    }
}
