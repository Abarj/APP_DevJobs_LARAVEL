<form class="md:w-1/2 space-y-5" wire:submit.prevent='editarVacante'>
    <!-- Título de la Vacante -->
    <div>
        <x-label for="titulo" :value="__('Título de la vacante')" />

        <!-- wire:model sustituye a name para comunicarse con el Backend -->
        <x-input id="titulo" class="block mt-1 w-full" type="text" wire:model="titulo" :value="old('titulo')" placeholder="Añade un título..." />

        @error('titulo')
            <livewire:mostrar-alerta :message="$message" /> <!-- :message es un atributo dinámico. En el momento en el que lo pasas de esta forma tienes que registrarlo en el componente (public $message;) -->
        @enderror
    </div>

    <!-- Salario Mensual -->
    <div>
        <x-label for="salario" :value="__('Salario mensual')" />

        <select
            id="salario"
            wire:model="salario_id"
            class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full"
        >
            <option>-- Seleccione --</option>

            @foreach ($salarios as $salario)
                <option value="{{ $salario->id }}">{{ $salario->salario }}</option>
            @endforeach
        </select>

        @error('salario')
            <livewire:mostrar-alerta :message="$message" /> <!-- :message es un atributo dinámico. En el momento en el que lo pasas de esta forma tienes que registrarlo en el componente (public $message;) -->
        @enderror
    </div>

    <!-- Categoría -->
    <div>
        <x-label for="categoria" :value="__('Categoría')" />

        <select
            id="categoria"
            wire:model="categoria_id"
            class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full"
        >
            <option>-- Seleccione --</option>
                
            @foreach ($categorias as $categoria)
                <option value="{{ $categoria->id }}">{{ $categoria->categoria }}</option>
            @endforeach
        </select>

        @error('categoria')
            <livewire:mostrar-alerta :message="$message" /> <!-- :message es un atributo dinámico. En el momento en el que lo pasas de esta forma tienes que registrarlo en el componente (public $message;) -->
        @enderror
    </div>

    <!-- Empresa -->
    <div>
        <x-label for="empresa" :value="__('Empresa')" />

        <x-input id="empresa" class="block mt-1 w-full" type="text" wire:model="empresa" :value="old('empresa')" placeholder="Empresa: ej. Netflix, Uber, Shopify..." />

        @error('empresa')
            <livewire:mostrar-alerta :message="$message" /> <!-- :message es un atributo dinámico. En el momento en el que lo pasas de esta forma tienes que registrarlo en el componente (public $message;) -->
        @enderror
    </div>

    <!-- Fecha Límite -->
    <div>
        <x-label for="fecha_limite" :value="__('Fecha límite para postularse')" />

        <x-input id="fecha_limite" class="block mt-1 w-full" type="date" wire:model="fecha_limite" :value="old('fecha_limite')" />

        @error('fecha_limite')
            <livewire:mostrar-alerta :message="$message" /> <!-- :message es un atributo dinámico. En el momento en el que lo pasas de esta forma tienes que registrarlo en el componente (public $message;) -->
        @enderror
    </div>

    <!-- Descripción puesto -->
    <div>
        <x-label for="descripcion" :value="__('Descripción del puesto')" />

        <textarea wire:model="descripcion" placeholder="Introduce una descripción del puesto, experiencia requerida... etc." class="rounded-md shadow-sm border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 w-full h-56"></textarea>
        
        @error('descripcion')
            <livewire:mostrar-alerta :message="$message" /> <!-- :message es un atributo dinámico. En el momento en el que lo pasas de esta forma tienes que registrarlo en el componente (public $message;) -->
        @enderror
    </div>

    <!-- Imagen -->
    <div>
        <x-label for="imagen" :value="__('Imagen')" />

        <x-input id="imagen" class="block mt-1 w-full" type="file" wire:model="imagen_nueva" accept="image/*" />

        <div class="my-5 w-80">
            <x-label :value="__('Imagen actual')" />

            <img src="{{ asset('storage/vacantes/' . $imagen) }}" alt="{{ 'Imagen vacante ' . $titulo }}">
        </div>

        <div class="my-5 w-80">
            @if($imagen_nueva)
                <x-label :value="__('Nueva imagen')" />

                <img src="{{ $imagen_nueva->temporaryUrl() }}">
            @endif
        </div>

        @error('imagen_nueva')
            <livewire:mostrar-alerta :message="$message" /> <!-- :message es un atributo dinámico. En el momento en el que lo pasas de esta forma tienes que registrarlo en el componente (public $message;) -->
        @enderror
    </div>

    <x-button>
        Guardar Cambios
    </x-button>
</form>

