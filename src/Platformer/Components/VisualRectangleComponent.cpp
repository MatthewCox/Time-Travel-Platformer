#include "VisualRectangleComponent.h"


#include <SFML/Window.hpp>


#include "FlatWorld/ComponentSystem/GameObject.h"

#include "FlatWorld/Maths/Vector2f.h"


#include "Components/SpatialComponent.h"

using namespace FlatWorld;

void VisualRectangleComponent::Draw() const
{
	static const GLfloat vertices[] = 
	{
		-0.5f, -0.5f,
		0.5f, -0.5f,
		0.5f, 0.5f,
		-0.5f, 0.5f
	};

	static const GLfloat texCoords[] =
	{
		0.f, 0.f,
		1.f, 0.f,
		1.f, 1.f,
		0.f, 1.f
	};

	glEnableClientState(GL_VERTEX_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	glVertexPointer(2, GL_FLOAT, 0, vertices);
	glTexCoordPointer(2, GL_FLOAT, 0, texCoords);

	glPushMatrix();
	{
		GameComponent* gameComponent = GetOwner()->GetComponent(GCIdType("SpatialComponent"));
		SpatialComponent* spatialComponent = static_cast<SpatialComponent*>(gameComponent);

		if (spatialComponent)
		{
			Vector2f position = spatialComponent->GetPosition();
			Vector2f scale = spatialComponent->GetScale();

			glTranslatef(position.X(), position.Y(), 0.f);
			glRotatef(spatialComponent->GetRotation(), 0.f, 0.f, 1.f);
			glScalef(scale.X(), scale.Y(), 1.f);
		}
		else
		{
			glTranslatef(0.f, 0.f, 0.f);
			glRotatef(0.f, 0.f, 0.f, 1.f);
			glScalef(1.f, 1.f, 1.f);
		}

		glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
	}
	glPopMatrix();

	glDisableClientState(GL_VERTEX_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
}
