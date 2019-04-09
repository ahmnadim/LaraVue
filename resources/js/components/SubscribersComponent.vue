<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 mt-3">
            <div class="card mt-4" v-if="!Gate.adminOrAuthor()">
               <not-found></not-found>
               <h1>NOT FOUND</h1>
             </div>
            </div>
            <div class="col-md-8" v-if="Gate.adminOrAuthor()">
                <div class="card">
                    <div class="card-header">Subscribers Component</div>

                    <div class="card-body">
                        I'm an subscribers component.
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
