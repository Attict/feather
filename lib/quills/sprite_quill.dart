part of feathers;

class SpriteQuill extends Quill {

  @override
  void init() {
    super.init();
  }

  /// Init using the colorComponent
  void initWithColor(Color color) {
    addComponent<ColorComponent>(new ColorComponent()..setColor(color));
  }

  /// Init using the textureComponent
  void initWithTexture(Texture texture, {Rect source}) {
    final textureComponent =
        addComponent<TextureComponent>(new TextureComponent())
          ..setTexture(texture);
    if (source != null) {
      textureComponent.setSource(source);
    }
  }

  /// Init using the animationComponent
  void initWithAnimation(Animation animation) {
    AnimationComponent animationComponent = new AnimationComponent()
      ..addAnimation('main', animation);
    addComponent<AnimationComponent>(animationComponent);
  }

  /// TODO:
  /// Initialize with a list of animation, setting
  /// the [0] index as current
  void initWithAnimations(Map<String, Animation> animations) {
    if (!hasComponent<AnimationComponent>()) {
      addComponent<AnimationComponent>(new AnimationComponent());
    }
    getComponent<AnimationComponent>()
      ..setAnimations(animations);
  }

  /// Set the position
  void setPosition(double x, double y) {
    if (!hasComponent<PositionComponent>()) {
      addComponent<PositionComponent>(new PositionComponent());
    }
    getComponent<PositionComponent>()..setPosition(x, y);
  }

  /// Set the size
  void setSize(double width, double height) {
    if (!hasComponent<SizeComponent>()) {
      addComponent<SizeComponent>(new SizeComponent());
    }
    getComponent<SizeComponent>()..setSize(width, height);
    //..setSize(width, height);
  }

  /// Set the current animation
  void setAnimation() {}

  /// Add an event to the sprite?
  void addEvent(Event event, Function callback) {
    if (!hasComponent<InputComponent>()) {
      addComponent<InputComponent>(new InputComponent());
    }
    getComponent<InputComponent>()..addEvent(event, callback);
  }

  /// Offset
  void setOffset(double x, double y, {bool scale = true}) {
    if (!hasComponent<PositionComponent>()) {
      addComponent<PositionComponent>(new PositionComponent());
    }
    final PositionComponent position = getComponent<PositionComponent>();
    if (!scale) {
      position.setOffset(x, y);
    } else {
      if (!hasComponent<SizeComponent>()) {
        return;
      }
      final SizeComponent size = getComponent<SizeComponent>();
      position.setOffset(size.width * x, size.height * y);
    }
  }
}
