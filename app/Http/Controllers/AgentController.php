<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Agent;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;

class AgentController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('agent')) {
            $agents = Agent::where('is_active', true)->get();
            return view('agent.create',compact('agents'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('agents')->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);
        $agents = $request->all();
        $agents['is_active'] = true;
        Agent::create($agents);
        return redirect('agents')->with('message', 'Data inserted successfully');
    }

    public function edit($id)
    {
        $agent = Agent::find($id);
        return $agent;
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => [
                'max:255',
                    Rule::unique('agents')->ignore($request->agent_id)->where(function ($query) {
                    return $query->where('is_active', 1);
                }),
            ],
        ]);

        $input = $request->all();
        $agent = Agent::find($input['agent_id']);

        $agent->update($input);
        return redirect('agents')->with('message', 'Data updated successfully');
    }

    public function exportAgent(Request $request)
    {
        $agents = $request['catcher_teamArray'];
        $csvData=array('name, description, commission_rate, percentage');
        foreach ($agents as $agent) {
            if($agent > 0) {
                $data = Agent::where('id', $agent)->first();
                $csvData[]=$data->name. ',' . $data->description . ',' . $data->commission_rate . ',' . $data->percentage;
            }   
        }        
        $filename="agent- " .date('d-m-Y').".csv";
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
        $agent_id = $request['agentIdArray'];
        foreach ($agent_id as $id) {
            $agent = Agent::find($id);
            $agent->is_active = false;
            $agent->save();
        }
        return 'Agent deleted successfully!';
    }

    public function destroy($id)
    {
        $agent = Agent::find($id);
        $agent->is_active = false;
        $agent->save();
        return redirect('agents')->with('not_permitted', 'Data deleted successfully');
    }
}
