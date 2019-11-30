<template>
    <div>
        <h6>{{ message }}</h6>
        <input v-model="nome">
        <h3>Agora é só sentar o dedo</h3>
        <h6>{{ nome }}</h6>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                message: "Um componente, funcionando!",
                nome: null
            }
        }
    }
</script>

<style scoped>
    p {
        font-size: 2em;
        text-align: center;
    }
</style>
