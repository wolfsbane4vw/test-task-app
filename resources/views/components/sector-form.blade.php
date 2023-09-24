<x-layout>
    <form method="post" action={{$is_edit_mode ? route('user_sector.update'): route('user_sector.store')}}>
        @csrf

        @if($is_edit_mode)
            @method('PUT')
        @endif

        <div class="form-item">
            <label for="name">Name:</label>
            <input type="text"
                   name="name"
                   id="name"
                   class="border @error('name') is-invalid @enderror"
                   @if(!empty(old('name')))
                       value="{{old('name')}}"
                   @endif
                   @if(empty(old('name')) && !empty($usersDetails->name))
                       value="{{$usersDetails->name}}"
                  @endif

        </div>

        @error('name')
        <div class="text-sm text-red-500">{{ $message }}</div>
        @enderror

        <div>
            <label for="sectorSelect">Sector:</label>
        </div>
        <div class="select select-tree pl-2">
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
        <div class="text-sm text-red-500">{{ $message }}</div>
        @enderror

        <div class="form-item">
            <label for="agree-to-terms">Agree to terms</label>
            <input type="checkbox"
                   name="agree-to-terms"
                   id="agree-to-terms"
                   value="1"
                   @if(empty(old()))
                       @checked(!empty($usersDetails) && $usersDetails->agree_to_terms)
                   @elseif(!empty(old('agree-to-terms')))
                       checked
                   @endif
                   class="@error('agree-to-terms') is-invalid @enderror">
        </div>

        @error('agree-to-terms')
        <div class="text-sm text-red-500">{{ $message }}</div>
        @enderror

        <div class="form-item">
            <button type="submit" class="btn btn-blue">Save</button>
        </div>
    </form>

</x-layout>
