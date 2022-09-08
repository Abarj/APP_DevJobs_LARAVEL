<div class="p-10">
    <div class="mb-5">
        <div class="flex justify-between items-center">
            <h3 class="font-bold text-3xl text-gray-800 my-3">
                {{ $vacante->titulo }}
            </h3>

            @if( @isset(auth()->user()->id) && $vacante->user_id === auth()->user()->id)
                <a href="{{ route('vacantes.edit', $vacante->id) }}" class="bg-blue-600 py-2 px-4 rounded-lg text-white text-xs font-bold uppercase flex items-center justify-center md:justify-between gap-2 text-center">
                    <p>Editar</p>
                    
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125" />
                    </svg>
                </a>
            @else
                
            @endif
        </div>

        <div class="md:grid md:grid-cols-2 bg-gray-100 border p-4 my-10 rounded">
            <p class="font-bold text-sm uppercase text-gray-800 my-3">
                Empresa: <span class="normal-case font-normal">{{ $vacante->empresa }}</span>
            </p>

            <p class="font-bold text-sm uppercase text-gray-800 my-3">
                Fecha límite: <span class="normal-case font-normal">{{ ($vacante->fecha_limite)->toFormattedDateString() }}</span>
            </p>
            
            <p class="font-bold text-sm uppercase text-gray-800 my-3">
                Categoría: <span class="normal-case font-normal">{{ $vacante->categoria->categoria }}</span>
            </p>

            <p class="font-bold text-sm uppercase text-gray-800 my-3">
                Salario: <span class="normal-case font-normal">{{ $vacante->salario->salario}}</span>
            </p>
        </div>
    </div>

    <div class="md:grid md:grid-cols-6 gap-4">
        <div class="md:col-span-2">
            <img src="{{ asset('storage/vacantes/' . $vacante->imagen) }}" alt="{{ 'Imagen vacante' . $vacante->titulo }}">
        </div>

        <div class="md:col-span-4">
            <h2 class="text-2xl font-bold mb-5">
                Descripción del puesto
            </h2>

            <p>
                {{ $vacante->descripcion }}
            </p>
        </div>
    </div>

    @guest
        <div class="mt-5 bg-gray-100 border border-dashed p-5 text-center rounded">
            <p>
                ¿Deseas aplicar a esta vacante? <a href="{{ route('register') }}" class="font-bold text-indigo-600">¡Crea una cuenta y aplica a esta y otras vacantes!</a>
            </p>
        </div>
    @endguest

    @cannot('create', App\Models\Vacante::class)
        
            <livewire:postular-vacante
                :vacante="$vacante"
            />
        
    @endcannot
</div>
