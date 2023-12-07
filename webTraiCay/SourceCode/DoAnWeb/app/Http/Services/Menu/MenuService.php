<?php
namespace App\Http\Services\Menu;

use App\Models\Menu;
use Exception;
use Illuminate\Support\Facades\Session;

class MenuService{

    public function getParent(){
        return Menu::where('parent_id',0)->get();
    }

    public function show(){
        return Menu::select('name', 'id')
        ->where('parent_id',0)
        ->orderbyDesc('id')
        ->get();
    }

    public function getall(){
        return Menu::orderbyDesc('id')->paginate(20);
    }
    public function create($request){
        try {
            Menu::create([
                'name' => (string)$request->input('name'),
                'parent_id' => (int)$request->input('parent_id'),
                'description' => (string)$request->input('description'),
                'content' => (string)$request->input('content'),
                'active' => (string)$request->input('active')
            ]);

            Session::flash('success', 'Tạo Danh Mục Thành Công');
        } catch (\Exception $err) {
            Session::flash('error', $err->getMessage());
            return false;
        }
        return true;
    }
    public function destroy($request){
            $id = (int)$request->input('id');
            $menu = Menu::where('id', $id)->first();
            if ($menu) {
                return Menu::where('id', $id)->orWhere('parent_id', $id)->delete();
            }
    
            return false;
        }
        public function update($request, $menu): bool
    {
        if ($request->input('parent_id') != $menu->id) {
            $menu->parent_id = (int)$request->input('parent_id');
        }

        $menu->name = (string)$request->input('name');
        $menu->description = (string)$request->input('description');
        $menu->content = (string)$request->input('content');
        $menu->active = (string)$request->input('active');
        $menu->save();

        Session::flash('success', 'Cập nhật thành công Danh mục');
        return true;
    }
    public function getID($id){
        return Menu::where('id',$id)->where('active',1)->firstOrFail();
        //khi đưa id vào nếu id tồn tại thì nó sẽ trả về kết quả
        //id không tồn tài thì chạy firstOrFail (đưa ra lỗi 404)
    }
    public function getProduct($menu){
        return $menu->products()->select('id','name','price','price_sale','thumb')
        ->where('active',1)->orderByDesc('id')->paginate(12);
    }
     
}

