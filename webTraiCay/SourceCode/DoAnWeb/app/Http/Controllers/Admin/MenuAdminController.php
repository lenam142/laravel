<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Menu\CreateFormRequest;
use Illuminate\Http\Request;
use App\http\Services\Menu\MenuService;
use App\Models\Menu;

class MenuAdminController extends Controller
{ 
    protected $menuService;
    public function __construct(MenuService $menuService){
        $this->menuService = $menuService;
    }
    public function create(){
        return view('admin.menu.add',[
            'title'=>'them danh muc moi',
            'menus'=>$this->menuService->getParent()
        ]);
    }
    public function store(CreateFormRequest $request)
    {
        // dd($request->input());
        $this->menuService->create($request);

        return redirect()->back();
    }
    public function index(){
        return view('admin.menu.list',[
            'title' => 'Danh sách danh mục mới nhất',
            'menus' => $this->menuService->getall()
        ]);
    }
    public function destroy(Request $request){
        $result = $this->menuService->destroy($request);
        if($result){
            return response()->json([
                'error'=> false,
                'message'=>'xóa thành công danh mục'
            ]);
        }
        return response()->json([
            'error'=>true
        ]);
    }
    public function show(Menu $menu) {
        // dd($menu->name);
        return view('admin.menu.edit',[
            'title' => 'Chỉnh sửa danh mục' .$menu->name,
            'menu' => $menu,
            'menus' => $this->menuService->getParent()
        ]);
    }
    public function update(Menu $menu, CreateFormRequest $request)
    {
        $this->menuService->update($request, $menu);

        return redirect('/admin/menus/list');
    }
}
