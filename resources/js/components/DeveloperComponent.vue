<template>
    <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-12 mt-3">
            <div class="card mt-4" v-if="!Gate.adminOrAuthor()">
               <not-found></not-found>
               <h1>NOT FOUND</h1>
             </div>
            </div>
            <div class="col-md-12 mt-3" v-if="Gate.adminOrAuthor()">
               <passport-clients></passport-clients>
               <passport-authorized-clients></passport-authorized-clients>
               <passport-personal-access-tokens></passport-personal-access-tokens>
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
