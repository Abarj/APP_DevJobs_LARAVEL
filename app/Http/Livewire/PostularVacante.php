<?php

namespace App\Http\Livewire;

use App\Models\Vacante;
use App\Notifications\NuevoCandidato;
use Livewire\Component;
use Livewire\WithFileUploads;

class PostularVacante extends Component
{
    use WithFileUploads;

    public $cv;
    public $vacante;

    protected $rules = [
        'cv' => 'required|mimes:pdf'
    ];

    public function mount(Vacante $vacante) {
        
        $this->vacante = $vacante;
    }

    public function postularme() {

        // Si pasa la validación el form se asigna a una variable ($datos)
        // Si hay errores se imprimen en pantalla
        $datos = $this->validate();

        // Validar que el usuario no haya postulado a la vacante
        if($this->vacante->candidatos()->where('user_id', auth()->user()->id)->count() > 0) {
            // Crear el mensaje de error
            session()->flash('error', 'Ya has postulado anteriormente a esta vacante');
        }
        else{
            // Almacenar el CV
            $cv = $this->cv->store('public/cv');
            $datos['cv'] = str_replace('public/cv/', '', $cv);

            // Crear el candidato a la vacante
            $this->vacante->candidatos()->create([
                'user_id' => auth()->user()->id,
                'cv' => $datos['cv']
            ]);

            // Crear notificación y enviar el email
            $this->vacante->reclutador->notify(new NuevoCandidato( $this->vacante->id, $this->vacante->titulo, auth()->user()->id ));

            // Mostrar al usuario un alerta de éxito
            session()->flash('mensaje', 'Tu información se envió correctamente, ¡Suerte!');

            return redirect()->back();
        }
    }

    public function render()
    {
        return view('livewire.postular-vacante');
    }
}
