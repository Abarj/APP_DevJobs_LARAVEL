<?php

namespace App\Http\Livewire;

use App\Models\Salario;
use Livewire\Component;
use App\Models\Categoria;
use App\Models\Vacante;
use Illuminate\Support\Carbon;
use Livewire\WithFileUploads;

class EditarVacante extends Component
{
    public $vacante_id; // Renombramos $id ya que está reservado para el uso interno de Livewire
    public $titulo;
    public $salario_id;
    public $categoria_id;
    public $empresa;
    public $fecha_limite;
    public $descripcion;
    public $imagen;
    public $imagen_nueva;

    use WithFileUploads;



    protected $rules = [
        'titulo' => 'required|string',
        'salario_id' => 'required',
        'categoria_id' => 'required',
        'empresa' => 'required',
        'fecha_limite' => 'required',
        'descripcion' => 'required',
        'imagen_nueva' => 'nullable|image|max:1024' // NULLABLE permite que el campo pueda ir vacio pero en caso de que tenga algo tiene que ser una imagen y max debe de pesar 1mb
    ];

    public function mount(Vacante $vacante)
    {
        $this->vacante_id = $vacante->id;
        $this->titulo = $vacante->titulo;
        $this->salario_id = $vacante->salario_id;
        $this->categoria_id = $vacante->categoria_id;
        $this->empresa = $vacante->empresa;
        $this->fecha_limite = Carbon::parse($vacante->fecha_limite)->format('Y-m-d');
        $this->descripcion = $vacante->descripcion;
        $this->imagen = $vacante->imagen;
        
    }

    public function editarVacante()
    {
        $datos = $this->validate();

        // Revisar si hay una nueva imagen
        if($this->imagen_nueva) {
            $imagen = $this->imagen_nueva->store('public/vacantes');
            $datos['imagen'] = str_replace('public/vacantes/', '', $imagen);
        }

        // Encontrar la vacante a editar
        $vacante = Vacante::find($this->vacante_id);

        // Asignar los valores
        $vacante->titulo = $datos['titulo'];
        $vacante->salario_id = $datos['salario_id'];
        $vacante->categoria_id = $datos['categoria_id'];
        $vacante->empresa = $datos['empresa'];
        $vacante->fecha_limite = $datos['fecha_limite'];
        $vacante->descripcion = $datos['descripcion'];
        $vacante->imagen = $datos['imagen'] ?? $vacante->imagen;

        // Guardar la vacante
        $vacante->save();

        // Redireccionar
        session()->flash('mensaje', 'La vacante se ha actualizado correctamente');

        return redirect()->route('vacantes.index');
    }

    public function render()
    {
        // Consultar BD
        $salarios = Salario::all();
        $categorias = Categoria::all();
        
        return view('livewire.editar-vacante', [
            'salarios' => $salarios,
            'categorias' => $categorias
        ]);
    }
}
