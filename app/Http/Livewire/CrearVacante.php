<?php

namespace App\Http\Livewire;

use App\Models\Categoria;
use App\Models\Salario;
use App\Models\Vacante;
use Livewire\Component;
use Livewire\WithFileUploads;

class CrearVacante extends Component
{
    public $titulo;
    public $salario_id;
    public $categoria_id;
    public $empresa;
    public $fecha_limite;
    public $descripcion;
    public $imagen;

    use WithFileUploads;


    
    protected $rules = [
        'titulo' => 'required|string',
        'salario_id' => 'required',
        'categoria_id' => 'required',
        'empresa' => 'required',
        'fecha_limite' => 'required',
        'descripcion' => 'required',
        'imagen' => 'required|image|max:1024'
    ];

    public function crearVacante()
    {
        // Si pasa la validación el form se asigna a una variable ($datos)
        // Si hay errores se imprimen en pantalla
        $datos = $this->validate();

        // Almacenar la imagen
        $imagen = $this->imagen->store('public/vacantes');
        $datos['imagen'] = str_replace('public/vacantes/', '', $imagen);
        
        // Crear la vacante
        Vacante::create([
            'titulo' => $datos['titulo'],
            'salario_id' => $datos['salario_id'],
            'categoria_id' => $datos['categoria_id'],
            'empresa' => $datos['empresa'],
            'fecha_limite' => $datos['fecha_limite'],
            'descripcion' => $datos['descripcion'],
            'imagen' => $datos['imagen'],
            'user_id' => auth()->user()->id
        ]);

        // Crear alerta
        session()->flash('mensaje', 'La vacante se publicó correctamente');

        // Redireccionar al usuario
        return redirect()->route('vacantes.index');
    }

    public function render()
    {
        // Consultar BD
        $salarios = Salario::all();
        $categorias = Categoria::all();

        return view('livewire.crear-vacante', [
            'salarios' => $salarios,
            'categorias' => $categorias
        ]);
    }
}
