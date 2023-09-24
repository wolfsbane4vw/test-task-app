@props(['sectors'])
<div class="form-item">
    <label for="sector">Sector:</label>
    <select name="sector" id="sector" multiple size="5">
    </select>
</div>
<script>
    import Treeselect from "treeselectjs";

    const treeSelect = new Treeselect({ $sectors })
</script>
