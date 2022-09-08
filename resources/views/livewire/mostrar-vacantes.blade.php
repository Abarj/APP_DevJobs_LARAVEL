<div>
    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
        @if(count($vacantes) > 0)
            @foreach ($vacantes as $vacante)
                <div class="p-6 bg-white border-b border-gray-200 md:flex md:justify-between md:items-center">
                    <div class="space-y-3">
                        <a href="{{ route('vacantes.show', $vacante->id) }}" class="text-xl font-bold">
                            {{ $vacante->titulo }}
                        </a>

                        <p class="text-sm text-gray-600 font-bold">
                            {{ $vacante->empresa }}
                        </p>

                        <p class="text-sm text-gray-600">
                            Fecha límite: <span class="font-medium">{{ $vacante->fecha_limite->format('d/m/Y') }}</span>
                        </p>
                    </div>

                    <div class="flex flex-col md:flex-row items-stretch gap-3 mt-5 md:mt-0">  
                        <a href="{{ route('candidatos.index', $vacante) }}" class="bg-slate-800 py-2 px-4 rounded-lg text-white text-xs font-bold uppercase flex items-center justify-center md:justify-between gap-2 text-center">
                            <div class="flex items-center gap-2">
                                <p class="text-base">{{ $vacante->candidatos->count() }}</p>
                                    
                                <p>@choice('Candidato|Candidatos', $vacante->candidatos->count())</p>
                            </div>
                            
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
                            </svg>
                        </a>

                        <a href="{{ route('vacantes.edit', $vacante->id) }}" class="bg-blue-600 py-2 px-4 rounded-lg text-white text-xs font-bold uppercase flex items-center justify-center md:justify-between gap-2 text-center">
                            <p>Editar</p>
                            
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125" />
                            </svg>
                        </a>

                        <button wire:click="$emit('mostrarAlerta', {{ $vacante->id }})" class="bg-red-600 py-2 px-4 rounded-lg text-white text-xs font-bold uppercase flex items-center justify-center md:justify-between gap-2 text-center">
                            <p>Eliminar</p>
                            
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
                            </svg>
                        </button>
                    </div>
                </div>
            @endforeach

        @else
            <p class="p-3 text-center text-sm text-gray-600">No hay vacantes que mostrar</p>

        @endif
    </div>

    <div class="mt-10 flex justify-center">
        {{ $vacantes->links() }}
    </div>
</div>

@push('scripts')
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script>
        Livewire.on('mostrarAlerta', vacanteId => {
            Swal.fire({
                title: '¿Eliminar vacante?',
                text: "Una vez eliminada no podrás recuperar su información",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: 'Cancelar'
                
            })
            .then((result) => {
                if (result.isConfirmed) {
                    // Eliminar la vacante
                    Livewire.emit('eliminarVacante', vacanteId)
                    Swal.fire(
                        '¡Eliminado!',
                        'La vacante ha sido eliminada correctamente',
                        'success'
                    )
                }
            })
        })    
    </script>
@endpush