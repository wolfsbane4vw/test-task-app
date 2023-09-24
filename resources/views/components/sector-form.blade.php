<x-layout>
    <form method="post" class="form" action={{$is_edit_mode ? route('user_sector.update'): route('user_sector.store')}}>
        @csrf

        @if($is_edit_mode)
            @method('PUT')
        @endif

        @if(session('success'))
            <div class="success-alert"
                 x-data="{show: true}"
                 x-show="show"
                 x-init="setTimeout(() => show = false, 3000)"
            >
                {{session('success')}}
            </div>
        @endif
        <div class="form__item ml-5 mr-5 italic">
            Please enter your name and pick the Sectors you are currently involved in.
        </div>

        <div class="form__item ml-5">
            <div>
                <label for="name">Name:</label>
            </div>
            <div>
                <input type="text"
                       name="name"
                       id="name"
                       class="form-input @error('name') is-invalid @enderror"
                       @if(!empty(old('name')))
                           value="{{old('name')}}"
                       @endif
                       @if(empty(old('name')) && !empty($usersDetails->name))
                           value="{{$usersDetails->name}}"
                    @endif
                />
            </div>
            @error('name')
                <div class="text-sm text-red-500">{{ $message }}</div>
            @enderror
        </div>

        <div class="form__item">
            <label for="sectorSelect" class="ml-5">Sector:</label>
            <div class="select select-tree">
                <ul class="select-container py-2 my-1 @error('sector') border-red-500  @enderror" id="sectorSelect">
                    @foreach($sectors as $sector)
                        <li class="list-none">

                            <input type="checkbox"
                                   name="sector[]"
                                   class="hidden-checkbox"
                                   id="sector{{$sector->value}}"
                                   value="{{$sector->value}}"
                                   @if(empty(old()))
                                       @checked(!empty($checkedSectors) && in_array($sector->value,$checkedSectors))
                                   @elseif(!empty(old('sector')) && in_array($sector->value,old('sector')))
                                       checked
                                @endif
                            />
                            <label for="sector{{$sector->value}}" class="option-label">{{ $sector->label }}</label>

                            @if(count($sector->children) > 0)
                                <ol class="group-children">
                                    @foreach($sector->children as $child)
                                        <x-form-components.select-sectors-child
                                            :child="$child"
                                            :checkedSectors="!empty($checkedSectors) ? $checkedSectors : []"/>
                                    @endforeach
                                </ol>
                            @endif
                        </li>
                    @endforeach
                </ul>
            </div>

            @error('sector')
            <div class="text-sm text-red-500 ml-5">{{ $message }}</div>
            @enderror
        </div>

        <div class="form__item ml-5">
            <input type="checkbox"
                   name="agree-to-terms"
                   id="agree-to-terms"
                   value="1"
                   @if(empty(old()))
                       @checked(!empty($usersDetails) && $usersDetails->agree_to_terms)
                   @elseif(!empty(old('agree-to-terms')))
                       checked
                   @endif
                   class="from-checkbox @error('agree-to-terms') is-invalid @enderror">
            <label for="agree-to-terms">Agree to terms</label>

            @error('agree-to-terms')
            <div class="text-sm text-red-500">{{ $message }}</div>
            @enderror
        </div>

        <div class="form__item ml-5">
            <button type="submit" class="btn btn-blue">Save</button>
        </div>
    </form>

</x-layout>
