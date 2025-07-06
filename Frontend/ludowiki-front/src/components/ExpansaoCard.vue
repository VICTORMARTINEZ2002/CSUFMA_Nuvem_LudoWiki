<script setup lang="ts">
import { ref } from 'vue'
import Card from 'primevue/card'

defineProps<{
	expansao:{
		id:number
		nome:string
		descricao:string
		img:string
		manual:string|null
		ano:number
		jogo_base:number
	}
}>()

const aberto = ref(false)
const toggle = () => aberto.value = !aberto.value
</script>

<template>
	<Card class="card-container" :class="{ fechado: !aberto }">
		<template #content>
			<div class="card-content" @click="toggle" style="cursor: pointer;">
				<h3 class="card-title">{{ expansao.nome }} ({{ expansao.ano }})</h3>
				<template v-if="aberto">
					<div class="detalhes">
						<img :src="expansao.img" alt="Capa da expansão" class="card-image" />
						<div class="card-info">
							<p class="card-description">{{ expansao.descricao }}</p>
							<a v-if="expansao.manual" :href="expansao.manual" target="_blank" class="card-manual-link">Manual (PDF)</a>
						</div>
					</div>
				</template>
			</div>
		</template>
	</Card>
</template>

<style scoped>
.card-container {
	background: #3D3D3D;
	box-shadow: 0 4px 6px rgba(0,0,0,0.1);
	margin-bottom: 1rem;
	transition: max-height 0.3s ease;
}

.card-content {
	padding: 1rem;
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

.card-title {
	font-size: 1.25rem;
	font-weight: 600;
	margin: 0;
}

.detalhes {
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

@media(min-width: 640px) {
	.detalhes {flex-direction: row;}
}

.card-image {
	width: 100%;
	height: 160px;
	object-fit: cover;
	border-radius: 0.375rem;
	max-width: 160px;
}

.card-info {
	flex: 1;
}

.card-description {
	color: white;
	font-size: 0.875rem;
	margin-top: 0.25rem;
}

.card-manual-link {
	color: #3B82F6;
	font-size: 0.875rem;
	text-decoration: underline;
	margin-top: 0.5rem;
	display: inline-block;
}

.card-manual-link:hover {
	color: #2563EB;
}

.card-container.fechado .detalhes {
	display: none;
}
</style>
