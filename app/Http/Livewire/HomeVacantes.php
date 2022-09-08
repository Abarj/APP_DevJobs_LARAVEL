<?php

namespace App\Http\Livewire;

use App\Models\Vacante;
use Livewire\Component;

class HomeVacantes extends Component
{   
    public $termino;
    public $categoria;
    public $salario;

    protected $listeners = ['terminosBusqueda' => 'buscar'];

    public function buscar($termino, $categoria, $salario) {

        $this->termino = $termino;
        $this->categoria = $categoria;
        $this->salario = $salario;
    }

    public function render()
    {
        // $vacantes = Vacante::all();

        $vacantes = Vacante::when($this->termino, function($query) { // When va a ejecutarse unicamente si hay un término de búsqueda, si está vacio no se ejecuta
            $query->where('titulo', 'LIKE', "%" . $this->termino . "%"); // Where se utiliza cuando un valor EXISTE
        })
        ->when($this->termino, function($query) {
            $query->orWhere('empresa', 'LIKE', "%" . $this->termino . "%"); // orWhere si no encuentra en 'titulo' busca en 'empresa'
        })
        ->when($this->categoria, function($query) {
            $query->where('categoria_id', $this->categoria);
        })
        ->when($this->salario, function($query) {
            $query->where('salario_id', $this->salario);
        })
        ->paginate(15);

        return view('livewire.home-vacantes', [
            'vacantes' => $vacantes
        ]);
    }
}
