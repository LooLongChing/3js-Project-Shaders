uniform vec2 uFrequency;
uniform float uTime;

attribute float aRandom;

varying vec2 vUv;
varying float vElevation;

void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elevation = modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1 ;
    elevation += modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1 ;

    modelPosition.z = elevation;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vUv = uv;
    vElevation = elevation;

    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}