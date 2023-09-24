<li>
    <input type="checkbox"
           value="{{$child->value}}"
           name="sector[]"
           id="sector{{$child->value}}"
           class="hidden-checkbox"
                @if(empty(old()))
                    @checked(!empty($checkedSectors) && in_array($child->value,$checkedSectors))
                @elseif(!empty(old('sector')) && in_array($child->value,old('sector')))
                    checked
                @endif

    />
    <label for="sector{{$child->value}}" class="option-label">{{ $child->label }}</label>

    @if(count($child->children) > 0)
        <ol class="group-children">
            @foreach($child->children as $subChild)
                <x-form-components.select-sectors-child :child="$subChild"
                                                        :checkedSectors="!empty($checkedSectors) ? $checkedSectors : []"/>
            @endforeach
        </ol>
    @endif

</li>
