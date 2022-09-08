<x-guest-layout>
    <x-auth-card>
        <x-slot name="logo">
            <a href="/">
                <x-application-logo class="w-20 h-20 fill-current text-gray-500" />
            </a>
        </x-slot>

        <div class="mb-4 text-sm text-gray-600">
            {{ __('
            Gracias por registrarte! Antes de comenzar, verifica tu dirección de correo electrónico haciendo clic en el enlace que te acabamos de enviar.') }}
        </div>

        @if (session('status') == 'verification-link-sent')
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ __('Te hemos enviado un email para restablecer tu contraseña') }}
            </div>
        @endif

        <div class="mt-4 flex items-center justify-between">
            <form method="POST" action="{{ route('verification.send') }}">
                @csrf

                <div>
                    <x-button>
                        {{ __('Reenviar Email de confirmación') }}
                    </x-button>
                </div>
            </form>

            <form method="POST" action="{{ route('logout') }}">
                @csrf

                <button type="submit" class="font-bold text-sm text-gray-600 hover:text-gray-900">
                    {{ __('Salir') }}
                </button>
            </form>
        </div>
    </x-auth-card>
</x-guest-layout>
