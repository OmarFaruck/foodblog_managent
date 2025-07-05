<template>
    <div v-show="isOpen" class="modal-backdrop">
        <div class="modal-content modal-animate">
            <div class="text-center mb-4">
                <i class="fa fa-exclamation-triangle text-warning fa-3x mb-3"></i>
                <h5 class="font-lobster">{{ title }}</h5>
                <p class="text-muted">{{ message }}</p>
            </div>
            <div class="d-flex justify-content-center mt-4">
                <button class="btn btn-admin-danger me-3" @click="confirm">
                    <i class="fa fa-check me-1"></i> Confirm
                </button>
                <button class="btn btn-secondary" @click="close">
                    <i class="fa fa-times me-1"></i> Cancel
                </button>
            </div>
        </div>
    </div>
</template>

<script setup>
import { defineProps, defineEmits } from 'vue'

const props = defineProps({
    isOpen: Boolean,
    title: {
        type: String,
        default: 'Confirm Delete'
    },
    message: {
        type: String,
        default: 'Are you sure you want to delete this item?'
    }
})

const emit = defineEmits(['close', 'confirm'])

const close = () => emit('close')
const confirm = () => emit('confirm')
</script>

<style scoped>
/*modal css */

.modal-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.6);
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    opacity: 1;
    transition: opacity 0.3s ease-in-out;
    backdrop-filter: blur(3px);
}

.modal-content {
    background: linear-gradient(to bottom, #ffffff, #f8f9fa);
    padding: 30px;
    width: 90%;
    max-width: 400px;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
    transform: scale(0.9);
    opacity: 0;
    transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275), 
                opacity 0.3s ease;
    border: none;
}

.modal-content.show {
    transform: scale(1);
    opacity: 1;
}

.text-warning {
    color: #ffc107;
}

.font-lobster {
    font-family: 'Lobster', cursive;
    font-size: 1.8rem;
    color: #333333;
}
</style>
