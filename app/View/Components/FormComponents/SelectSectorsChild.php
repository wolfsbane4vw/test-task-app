<?php

namespace App\View\Components\FormComponents;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class SelectSectorsChild extends Component
{

    public $child;

    /**
     * Create a new component instance.
     */
    public function __construct($child, public array $checkedSectors = [])
    {
        $this->child = $child;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.form-components.select-sectors-child');
    }
}
